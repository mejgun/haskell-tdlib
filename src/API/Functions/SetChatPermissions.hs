-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatPermissions where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions

data SetChatPermissions = 
 SetChatPermissions { permissions :: Maybe ChatPermissions.ChatPermissions, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatPermissions where
 toJSON (SetChatPermissions { permissions = permissions, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatPermissions", "permissions" A..= permissions, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatPermissions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatPermissions" -> parseSetChatPermissions v
   _ -> mempty
  where
   parseSetChatPermissions :: A.Value -> T.Parser SetChatPermissions
   parseSetChatPermissions = A.withObject "SetChatPermissions" $ \o -> do
    permissions <- optional $ o A..: "permissions"
    chat_id <- optional $ o A..: "chat_id"
    return $ SetChatPermissions { permissions = permissions, chat_id = chat_id }