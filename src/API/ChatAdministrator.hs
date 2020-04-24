-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatAdministrator where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatAdministrator = 
 ChatAdministrator { is_owner :: Maybe Bool, custom_title :: Maybe String, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatAdministrator where
 toJSON (ChatAdministrator { is_owner = is_owner, custom_title = custom_title, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatAdministrator", "is_owner" A..= is_owner, "custom_title" A..= custom_title, "user_id" A..= user_id ]

instance T.FromJSON ChatAdministrator where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatAdministrator" -> parseChatAdministrator v
   _ -> mempty
  where
   parseChatAdministrator :: A.Value -> T.Parser ChatAdministrator
   parseChatAdministrator = A.withObject "ChatAdministrator" $ \o -> do
    is_owner <- optional $ o A..: "is_owner"
    custom_title <- optional $ o A..: "custom_title"
    user_id <- optional $ o A..: "user_id"
    return $ ChatAdministrator { is_owner = is_owner, custom_title = custom_title, user_id = user_id }