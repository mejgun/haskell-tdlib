module TD.Data.FoundWebApp
  (FoundWebApp(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.WebApp as WebApp

data FoundWebApp
  = FoundWebApp -- ^ Contains information about a Web App found by its short name
    { web_app              :: Maybe WebApp.WebApp -- ^ The Web App
    , request_write_access :: Maybe Bool          -- ^ True, if the user must be asked for the permission to the bot to send them messages
    , skip_confirmation    :: Maybe Bool          -- ^ True, if there is no need to show an ordinary open URL confirmation before opening the Web App. The field must be ignored and confirmation must be shown anyway if the Web App link was hidden
    }
  deriving (Eq, Show)

instance I.ShortShow FoundWebApp where
  shortShow FoundWebApp
    { web_app              = web_app_
    , request_write_access = request_write_access_
    , skip_confirmation    = skip_confirmation_
    }
      = "FoundWebApp"
        ++ I.cc
        [ "web_app"              `I.p` web_app_
        , "request_write_access" `I.p` request_write_access_
        , "skip_confirmation"    `I.p` skip_confirmation_
        ]

instance AT.FromJSON FoundWebApp where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundWebApp" -> parseFoundWebApp v
      _             -> mempty
    
    where
      parseFoundWebApp :: A.Value -> AT.Parser FoundWebApp
      parseFoundWebApp = A.withObject "FoundWebApp" $ \o -> do
        web_app_              <- o A..:?  "web_app"
        request_write_access_ <- o A..:?  "request_write_access"
        skip_confirmation_    <- o A..:?  "skip_confirmation"
        pure $ FoundWebApp
          { web_app              = web_app_
          , request_write_access = request_write_access_
          , skip_confirmation    = skip_confirmation_
          }
  parseJSON _ = mempty

