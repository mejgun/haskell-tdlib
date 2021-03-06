-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LoginUrlInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains information about an inline button of type inlineKeyboardButtonTypeLoginUrl
data LoginUrlInfo = 
 -- |
 -- 
 -- An HTTP url needs to be open 
 -- 
 -- __url__ The URL to open
 -- 
 -- __skip_confirm__ True, if there is no need to show an ordinary open URL confirm
 LoginUrlInfoOpen { skip_confirm :: Maybe Bool, url :: Maybe String }  |
 -- |
 -- 
 -- An authorization confirmation dialog needs to be shown to the user 
 -- 
 -- __url__ An HTTP URL to be opened
 -- 
 -- __domain__ A domain of the URL
 -- 
 -- __bot_user_id__ User identifier of a bot linked with the website
 -- 
 -- __request_write_access__ True, if the user needs to be requested to give the permission to the bot to send them messages
 LoginUrlInfoRequestConfirmation { request_write_access :: Maybe Bool, bot_user_id :: Maybe Int, domain :: Maybe String, url :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON LoginUrlInfo where
 toJSON (LoginUrlInfoOpen { skip_confirm = skip_confirm, url = url }) =
  A.object [ "@type" A..= T.String "loginUrlInfoOpen", "skip_confirm" A..= skip_confirm, "url" A..= url ]

 toJSON (LoginUrlInfoRequestConfirmation { request_write_access = request_write_access, bot_user_id = bot_user_id, domain = domain, url = url }) =
  A.object [ "@type" A..= T.String "loginUrlInfoRequestConfirmation", "request_write_access" A..= request_write_access, "bot_user_id" A..= bot_user_id, "domain" A..= domain, "url" A..= url ]

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
    skip_confirm <- o A..:? "skip_confirm"
    url <- o A..:? "url"
    return $ LoginUrlInfoOpen { skip_confirm = skip_confirm, url = url }

   parseLoginUrlInfoRequestConfirmation :: A.Value -> T.Parser LoginUrlInfo
   parseLoginUrlInfoRequestConfirmation = A.withObject "LoginUrlInfoRequestConfirmation" $ \o -> do
    request_write_access <- o A..:? "request_write_access"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    domain <- o A..:? "domain"
    url <- o A..:? "url"
    return $ LoginUrlInfoRequestConfirmation { request_write_access = request_write_access, bot_user_id = bot_user_id, domain = domain, url = url }