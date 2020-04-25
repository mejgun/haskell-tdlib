-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LoginUrlInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data LoginUrlInfo = 
 LoginUrlInfoOpen { skip_confirm :: Maybe Bool, url :: Maybe String }  
 | LoginUrlInfoRequestConfirmation { request_write_access :: Maybe Bool, bot_user_id :: Maybe Int, domain :: Maybe String, url :: Maybe String }  deriving (Show, Eq)

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