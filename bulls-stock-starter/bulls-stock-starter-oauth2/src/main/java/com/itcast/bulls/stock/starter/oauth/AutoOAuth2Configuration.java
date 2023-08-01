package com.itcast.bulls.stock.starter.oauth;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpStatus;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.RemoteTokenServices;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@EnableAutoConfiguration
@EnableResourceServer
@EnableGlobalMethodSecurity(prePostEnabled = true)
@ConditionalOnProperty(name = "security.oauth2.resource.token-info-uri")
@ConfigurationProperties(prefix = "security.oauth2.client")
public class AutoOAuth2Configuration implements ResourceServerConfigurer {

    @Autowired
    protected RemoteTokenServices remoteTokenServices;

    @Autowired
    private RestTemplate lbRestTemplate;

    @Setter
    private List<String> ignoreUrls;


    /**
     * 远程调用，采用restTemplate方式处理
     * @param resourceServerSecurityConfigurer
     * @throws Exception
     */
    @Override
    public void configure(ResourceServerSecurityConfigurer resourceServerSecurityConfigurer) throws Exception {
        remoteTokenServices.setRestTemplate(lbRestTemplate);
        resourceServerSecurityConfigurer.tokenServices(remoteTokenServices);

    }

    /**
     * 资源服务安全配置
     * @param httpSecurity
     * @throws Exception
     */
    @Override
    public void configure(HttpSecurity httpSecurity) throws Exception {

        ExpressionUrlAuthorizationConfigurer<HttpSecurity>
                .ExpressionInterceptUrlRegistry registry = httpSecurity.csrf().disable()
                .authorizeRequests();

        // 设置无须认证的url路径
        if(null != ignoreUrls && ignoreUrls.size() > 0) {
            registry.antMatchers(ignoreUrls.toArray(new String[ignoreUrls.size()])).permitAll();
        }

        registry
                .antMatchers("/actuator/**", "/v2/**", "/doc.html",
                        "/swagger-ui.html", "/css/**").permitAll()
                .anyRequest().authenticated().and()
                .formLogin().loginPage("/login")
                .failureUrl("/login?error")
                .defaultSuccessUrl("/home");
    }

    /**
     * RestTemplate配置
     * @return
     */
    @Bean
    @Primary
    @LoadBalanced
    public RestTemplate lbRestTemplate() {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.setErrorHandler(new DefaultResponseErrorHandler() {
            @Override
            public void handleError(ClientHttpResponse response) throws IOException {
                if (response.getRawStatusCode() != HttpStatus.BAD_REQUEST.value()) {
                    super.handleError(response);
                }
            }
        });
        return restTemplate;
    }

}

