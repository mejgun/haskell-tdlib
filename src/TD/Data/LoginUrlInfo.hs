{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.LoginUrlInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about an inline button of type inlineKeyboardButtonTypeLoginUrl
data LoginUrlInfo
  = -- | An HTTP url needs to be open @url The URL to open @skip_confirm True, if there is no need to show an ordinary open URL confirm
    LoginUrlInfoOpen
      { -- |
        skip_confirm :: Maybe Bool,
        -- |
        url :: Maybe String
      }
  | -- | An authorization confirmation dialog needs to be shown to the user
    LoginUrlInfoRequestConfirmation
      { -- | True, if the user needs to be requested to give the permission to the bot to send them messages
        request_write_access :: Maybe Bool,
        -- | User identifier of a bot linked with the website
        bot_user_id :: Maybe Int,
        -- | A domain of the URL
        domain :: Maybe String,
        -- | An HTTP URL to be opened
        url :: Maybe String
      }
  deriving (Eq)

instance Show LoginUrlInfo where
  show
    LoginUrlInfoOpen
      { skip_confirm = skip_confirm_,
        url = url_
      } =
      "LoginUrlInfoOpen"
        ++ U.cc
          [ U.p "skip_confirm" skip_confirm_,
            U.p "url" url_
          ]
  show
    LoginUrlInfoRequestConfirmation
      { request_write_access = request_write_access_,
        bot_user_id = bot_user_id_,
        domain = domain_,
        url = url_
      } =
      "LoginUrlInfoRequestConfirmation"
        ++ U.cc
          [ U.p "request_write_access" request_write_access_,
            U.p "bot_user_id" bot_user_id_,
            U.p "domain" domain_,
            U.p "url" url_
          ]

instance T.FromJSON LoginUrlInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "loginUrlInfoOpen" -> parseLoginUrlInfoOpen v
      "loginUrlInfoRequestConfirmation" -> parseLoginUrlInfoRequestConfirmation v
      _ -> mempty
    where
      parseLoginUrlInfoOpen :: A.Value -> T.Parser LoginUrlInfo
      parseLoginUrlInfoOpen = A.withObject "LoginUrlInfoOpen" $ \o -> do
        skip_confirm_ <- o A..:? "skip_confirm"
        url_ <- o A..:? "url"
        return $ LoginUrlInfoOpen {skip_confirm = skip_confirm_, url = url_}

      parseLoginUrlInfoRequestConfirmation :: A.Value -> T.Parser LoginUrlInfo
      parseLoginUrlInfoRequestConfirmation = A.withObject "LoginUrlInfoRequestConfirmation" $ \o -> do
        request_write_access_ <- o A..:? "request_write_access"
        bot_user_id_ <- o A..:? "bot_user_id"
        domain_ <- o A..:? "domain"
        url_ <- o A..:? "url"
        return $ LoginUrlInfoRequestConfirmation {request_write_access = request_write_access_, bot_user_id = bot_user_id_, domain = domain_, url = url_}
  parseJSON _ = mempty

instance T.ToJSON LoginUrlInfo where
  toJSON
    LoginUrlInfoOpen
      { skip_confirm = skip_confirm_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "loginUrlInfoOpen",
          "skip_confirm" A..= skip_confirm_,
          "url" A..= url_
        ]
  toJSON
    LoginUrlInfoRequestConfirmation
      { request_write_access = request_write_access_,
        bot_user_id = bot_user_id_,
        domain = domain_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "loginUrlInfoRequestConfirmation",
          "request_write_access" A..= request_write_access_,
          "bot_user_id" A..= bot_user_id_,
          "domain" A..= domain_,
          "url" A..= url_
        ]
