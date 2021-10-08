-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatPermissions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions

-- |
-- 
-- Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right
-- 
-- __chat_id__ Chat identifier
-- 
-- __permissions__ New non-administrator members permissions in the chat
data SetChatPermissions = 

 SetChatPermissions { permissions :: Maybe ChatPermissions.ChatPermissions, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatPermissions where
 show SetChatPermissions { permissions=permissions, chat_id=chat_id } =
  "SetChatPermissions" ++ cc [p "permissions" permissions, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetChatPermissions where
 toJSON SetChatPermissions { permissions = permissions, chat_id = chat_id } =
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
    permissions <- o A..:? "permissions"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatPermissions { permissions = permissions, chat_id = chat_id }
 parseJSON _ = mempty
