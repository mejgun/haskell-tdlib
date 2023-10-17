module TD.Data.BotWriteAccessAllowReason
  (BotWriteAccessAllowReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.WebApp as WebApp

-- | Describes a reason why a bot was allowed to write messages to the current user
data BotWriteAccessAllowReason
  = BotWriteAccessAllowReasonConnectedWebsite -- ^ The user connected a website by logging in using Telegram Login Widget on it
    { domain_name :: Maybe T.Text -- ^ Domain name of the connected website
    }
  | BotWriteAccessAllowReasonAddedToAttachmentMenu -- ^ The user added the bot to attachment or side menu using toggleBotIsAddedToAttachmentMenu
  | BotWriteAccessAllowReasonLaunchedWebApp -- ^ The user launched a Web App using getWebAppLinkUrl
    { web_app :: Maybe WebApp.WebApp -- ^ Information about the Web App
    }
  | BotWriteAccessAllowReasonAcceptedRequest -- ^ The user accepted bot's request to send messages with allowBotToSendMessages
  deriving (Eq, Show)

instance I.ShortShow BotWriteAccessAllowReason where
  shortShow BotWriteAccessAllowReasonConnectedWebsite
    { domain_name = domain_name_
    }
      = "BotWriteAccessAllowReasonConnectedWebsite"
        ++ I.cc
        [ "domain_name" `I.p` domain_name_
        ]
  shortShow BotWriteAccessAllowReasonAddedToAttachmentMenu
      = "BotWriteAccessAllowReasonAddedToAttachmentMenu"
  shortShow BotWriteAccessAllowReasonLaunchedWebApp
    { web_app = web_app_
    }
      = "BotWriteAccessAllowReasonLaunchedWebApp"
        ++ I.cc
        [ "web_app" `I.p` web_app_
        ]
  shortShow BotWriteAccessAllowReasonAcceptedRequest
      = "BotWriteAccessAllowReasonAcceptedRequest"

instance AT.FromJSON BotWriteAccessAllowReason where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botWriteAccessAllowReasonConnectedWebsite"      -> parseBotWriteAccessAllowReasonConnectedWebsite v
      "botWriteAccessAllowReasonAddedToAttachmentMenu" -> pure BotWriteAccessAllowReasonAddedToAttachmentMenu
      "botWriteAccessAllowReasonLaunchedWebApp"        -> parseBotWriteAccessAllowReasonLaunchedWebApp v
      "botWriteAccessAllowReasonAcceptedRequest"       -> pure BotWriteAccessAllowReasonAcceptedRequest
      _                                                -> mempty
    
    where
      parseBotWriteAccessAllowReasonConnectedWebsite :: A.Value -> AT.Parser BotWriteAccessAllowReason
      parseBotWriteAccessAllowReasonConnectedWebsite = A.withObject "BotWriteAccessAllowReasonConnectedWebsite" $ \o -> do
        domain_name_ <- o A..:?  "domain_name"
        pure $ BotWriteAccessAllowReasonConnectedWebsite
          { domain_name = domain_name_
          }
      parseBotWriteAccessAllowReasonLaunchedWebApp :: A.Value -> AT.Parser BotWriteAccessAllowReason
      parseBotWriteAccessAllowReasonLaunchedWebApp = A.withObject "BotWriteAccessAllowReasonLaunchedWebApp" $ \o -> do
        web_app_ <- o A..:?  "web_app"
        pure $ BotWriteAccessAllowReasonLaunchedWebApp
          { web_app = web_app_
          }
  parseJSON _ = mempty

