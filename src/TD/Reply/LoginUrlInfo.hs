{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.LoginUrlInfo where

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
  | -- | An authorization confirmation dialog needs to be shown to the user @url An HTTP URL to be opened @domain A domain of the URL
    LoginUrlInfoRequestConfirmation
      { -- |
        request_write_access :: Maybe Bool,
        -- | User identifier of a bot linked with the website @request_write_access True, if the user needs to be requested to give the permission to the bot to send them messages
        bot_user_id :: Maybe Int,
        -- |
        domain :: Maybe String,
        -- |
        url :: Maybe String
      }
  deriving (Eq)

instance Show LoginUrlInfo where
  show
    LoginUrlInfoOpen
      { skip_confirm = skip_confirm,
        url = url
      } =
      "LoginUrlInfoOpen"
        ++ U.cc
          [ U.p "skip_confirm" skip_confirm,
            U.p "url" url
          ]
  show
    LoginUrlInfoRequestConfirmation
      { request_write_access = request_write_access,
        bot_user_id = bot_user_id,
        domain = domain,
        url = url
      } =
      "LoginUrlInfoRequestConfirmation"
        ++ U.cc
          [ U.p "request_write_access" request_write_access,
            U.p "bot_user_id" bot_user_id,
            U.p "domain" domain,
            U.p "url" url
          ]

instance T.FromJSON LoginUrlInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "loginUrlInfoOpen" -> parseLoginUrlInfoOpen v
      "loginUrlInfoRequestConfirmation" -> parseLoginUrlInfoRequestConfirmation v
      _ -> fail ""
    where
      parseLoginUrlInfoOpen :: A.Value -> T.Parser LoginUrlInfo
      parseLoginUrlInfoOpen = A.withObject "LoginUrlInfoOpen" $ \o -> do
        skip_confirm_ <- o A..:? "skip_confirm"
        url_ <- o A..:? "url"
        return $ LoginUrlInfoOpen {skip_confirm = skip_confirm_, url = url_}

      parseLoginUrlInfoRequestConfirmation :: A.Value -> T.Parser LoginUrlInfo
      parseLoginUrlInfoRequestConfirmation = A.withObject "LoginUrlInfoRequestConfirmation" $ \o -> do
        request_write_access_ <- o A..:? "request_write_access"
        bot_user_id_ <- mconcat [o A..:? "bot_user_id", U.rm <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        domain_ <- o A..:? "domain"
        url_ <- o A..:? "url"
        return $ LoginUrlInfoRequestConfirmation {request_write_access = request_write_access_, bot_user_id = bot_user_id_, domain = domain_, url = url_}
  parseJSON _ = fail ""

instance T.ToJSON LoginUrlInfo where
  toJSON
    LoginUrlInfoOpen
      { skip_confirm = skip_confirm,
        url = url
      } =
      A.object
        [ "@type" A..= T.String "loginUrlInfoOpen",
          "skip_confirm" A..= skip_confirm,
          "url" A..= url
        ]
  toJSON
    LoginUrlInfoRequestConfirmation
      { request_write_access = request_write_access,
        bot_user_id = bot_user_id,
        domain = domain,
        url = url
      } =
      A.object
        [ "@type" A..= T.String "loginUrlInfoRequestConfirmation",
          "request_write_access" A..= request_write_access,
          "bot_user_id" A..= bot_user_id,
          "domain" A..= domain,
          "url" A..= url
        ]
