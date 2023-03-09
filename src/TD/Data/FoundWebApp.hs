{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FoundWebApp where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.WebApp as WebApp
import qualified Utils as U

-- |
data FoundWebApp = -- | Contains information about a Web App found by its short name
  FoundWebApp
  { -- | True, if there is no need to show an ordinary open URL confirmation before opening the Web App. The field must be ignored and confirmation must be shown anyway if the Web App link was hidden
    skip_confirmation :: Maybe Bool,
    -- | True, if the user must be asked for the permission to the bot to send them messages
    request_write_access :: Maybe Bool,
    -- | The Web App
    web_app :: Maybe WebApp.WebApp
  }
  deriving (Eq)

instance Show FoundWebApp where
  show
    FoundWebApp
      { skip_confirmation = skip_confirmation_,
        request_write_access = request_write_access_,
        web_app = web_app_
      } =
      "FoundWebApp"
        ++ U.cc
          [ U.p "skip_confirmation" skip_confirmation_,
            U.p "request_write_access" request_write_access_,
            U.p "web_app" web_app_
          ]

instance T.FromJSON FoundWebApp where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "foundWebApp" -> parseFoundWebApp v
      _ -> mempty
    where
      parseFoundWebApp :: A.Value -> T.Parser FoundWebApp
      parseFoundWebApp = A.withObject "FoundWebApp" $ \o -> do
        skip_confirmation_ <- o A..:? "skip_confirmation"
        request_write_access_ <- o A..:? "request_write_access"
        web_app_ <- o A..:? "web_app"
        return $ FoundWebApp {skip_confirmation = skip_confirmation_, request_write_access = request_write_access_, web_app = web_app_}
  parseJSON _ = mempty

instance T.ToJSON FoundWebApp where
  toJSON
    FoundWebApp
      { skip_confirmation = skip_confirmation_,
        request_write_access = request_write_access_,
        web_app = web_app_
      } =
      A.object
        [ "@type" A..= T.String "foundWebApp",
          "skip_confirmation" A..= skip_confirmation_,
          "request_write_access" A..= request_write_access_,
          "web_app" A..= web_app_
        ]
