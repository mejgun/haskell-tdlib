-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatAdministrator where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatAdministrator = 
 ChatAdministrator { is_owner :: Bool, custom_title :: String, user_id :: Int }  -- deriving (Show)

instance T.ToJSON ChatAdministrator where
 toJSON (ChatAdministrator { is_owner = is_owner, custom_title = custom_title, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatAdministrator", "is_owner" A..= is_owner, "custom_title" A..= custom_title, "user_id" A..= user_id ]
-- chatAdministrator ChatAdministrator  { is_owner :: Bool, custom_title :: String, user_id :: Int } 



instance T.FromJSON ChatAdministrator where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatAdministrator" -> parseChatAdministrator v
  where
   parseChatAdministrator :: A.Value -> T.Parser ChatAdministrator
   parseChatAdministrator = A.withObject "ChatAdministrator" $ \o -> do
    is_owner <- o A..: "is_owner"
    custom_title <- o A..: "custom_title"
    user_id <- o A..: "user_id"
    return $ ChatAdministrator { is_owner = is_owner, custom_title = custom_title, user_id = user_id }