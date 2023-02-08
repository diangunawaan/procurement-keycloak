<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}" style="background: white; height: 100%;">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <style>
        .card-pf {
            border: none;
            border-color: transparent;
            box-shadow: none;
                margin: 0;
    padding: 0;
    width: 100%;
        }

        .pf-c-form-control {
            background: #FFFFFF;
            /* white - darken 30% */

            border: 1px solid #B3B3B3;
            box-sizing: border-box;
            border-radius: 5px;
        }

        .pf-c-form-control:hover {
            border: 1px solid #11A2CA;
        }

        .pf-m-primary {
            background: #03D4B4 !important;
            border-radius: 5px;
            padding: 10px 16px;
            min-height: 40px;
        }

        #img-procurite {
            position: absolute;
            left: -124px;
            top: -170px;
            opacity: 0.3;
            width: 144%;
            max-width: fit-content;
        }

        #left {
            overflow: hidden;
            min-height: 600px;
            border-radius: 12px; overflow: hidden; background: radial-gradient(100% 100% at 50% 0%, rgba(165, 254, 240, 0) 0%, rgba(3, 212, 180, 0.8) 49.74%, rgb(46, 169, 150) 92.19%);
        }

        #right {
            min-height: 600px;

        }

        #text-procurite {
            font-size: 14px; font-weight: 700; color: rgb(255, 255, 255); width: 80%;
            z-index: 90;
        }

        #wrapper {
            box-shadow: 0px 32px 100px rgba(0, 0, 0, 0.08);
            padding-left: 0 !important;
            padding-right: 0 !important;
            margin: 2rem;
        }

        #kc-info-wrapper {
            background: transparent !important;
        }

        #kc-registration a {
            color: #03D4B4;
            font-weight: bold;
            font-size: 12px;
            line-height: 16px;
            text-align: center;
            text-decoration-line: underline;
        }

        #kc-page-title {
            display: none;
        }
    </style>
</head>

<body style="background: white;">

<div class="col d-flex justify-content-center mt-5 px-5">

    <div class="container-fluid px-5" id="wrapper">

        <div class="no-gutters row">
            <div id="left" class="col d-flex justify-content-center px-5 col-md-6">
                <div class="row">
                    <div class="d-flex justify-content-center flex-column align-items-center col">
                        <img id="img-procurite" src="https://static-masden-1.s3.ap-southeast-1.amazonaws.com/editWIN00160.jpeg">    
                        <img src="https://static-masden-1.s3.ap-southeast-1.amazonaws.com/Procurite+logo-1-03+1.png">        
                        <p id="text-procurite" class="text-center">Explore all the  services you need to your business.</p>
                    </div>
                </div>
            </div>

            <div id="right" class="login-pf-page col d-flex flex-column justify-content-center mt-5 px-5 col-md-6" style="background: white; height: 100%; border-radius: 20px 0 0 20px;">
                <div id="kc-header" class="row">
                    <#--  <div id="kc-header-wrapper"
                        class="${properties.kcHeaderWrapperClass!}">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
                    </div>  -->
                        <div class="col d-flex flex-column align-items-center">
                            <h1 style="color: #03D4B4; font-weight: bolder;">Welcome to Procurite</h1>
                            <p style="color: #909090;">lets dive in into your account</p>
                        </div>
                </div>
                <div class="col px-5">        
                    <header class="${properties.kcFormHeaderClass!}">
                        <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                            <div id="kc-locale">
                                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                    <div class="kc-dropdown" id="kc-locale-dropdown">
                                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                        <ul>
                                            <#list locale.supported as l>
                                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                            </#list>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </#if>
                    <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                        <#if displayRequiredFields>
                            <div class="${properties.kcContentWrapperClass!}">
                                <div class="${properties.kcLabelWrapperClass!} subtitle">
                                    <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                                </div>
                                <div class="col-md-10">
                                    <h1 id="kc-page-title"><#nested "header"></h1>
                                </div>
                            </div>
                        <#else>
                            <h1 id="kc-page-title"><#nested "header"></h1>
                        </#if>
                    <#else>
                        <#if displayRequiredFields>
                            <div class="${properties.kcContentWrapperClass!}">
                                <div class="${properties.kcLabelWrapperClass!} subtitle">
                                    <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                                </div>
                                <div class="col-md-10">
                                    <#nested "show-username">
                                    <div id="kc-username" class="${properties.kcFormGroupClass!}">
                                        <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                        <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                            <div class="kc-login-tooltip">
                                                <i class="${properties.kcResetFlowIcon!}"></i>
                                                <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        <#else>
                            <#nested "show-username">
                            <div id="kc-username" class="${properties.kcFormGroupClass!}">
                                <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                    <div class="kc-login-tooltip">
                                        <i class="${properties.kcResetFlowIcon!}"></i>
                                        <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                    </div>
                                </a>
                            </div>
                        </#if>
                    </#if>
                </header>
                <div id="kc-content">
                    <div id="kc-content-wrapper">

                    <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                    <#-- during login.                                                                               -->
                    <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                        <div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                            <div class="pf-c-alert__icon">
                                <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                                <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                            </div>
                                <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>

                    <#nested "form">

                        <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                            <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                                <div class="${properties.kcFormGroupClass!}">
                                    <input type="hidden" name="tryAnotherWay" value="on"/>
                                    <a href="#" id="try-another-way"
                                    onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                                </div>
                            </form>
                        </#if>

                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcSignUpClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                    </div>
                </div>

                </div>
            </div>
        </div>
    </div>


</div>


</body>
</html>
</#macro>
