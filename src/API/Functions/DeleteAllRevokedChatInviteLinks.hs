-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteAllRevokedChatInviteLinks where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
-- 
-- __chat_id__ Chat identifier
-- 
-- __creator_user_id__ User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
data DeleteAllRevokedChatInviteLinks = 

 DeleteAllRevokedChatInviteLinks { creator_user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show DeleteAllRevokedChatInviteLinks where
 show DeleteAllRevokedChatInviteLinks { creator_user_id=creator_user_id, chat_id=chat_id } =
  "DeleteAllRevokedChatInviteLinks" ++ cc [p "creator_user_id" creator_user_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteAllRevokedChatInviteLinks where
 toJSON DeleteAllRevokedChatInviteLinks { creator_user_id = creator_user_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "deleteAllRevokedChatInviteLinks", "creator_user_id" A..= creator_user_id, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteAllRevokedChatInviteLinks where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteAllRevokedChatInviteLinks" -> parseDeleteAllRevokedChatInviteLinks v
   _ -> mempty
  where
   parseDeleteAllRevokedChatInviteLinks :: A.Value -> T.Parser DeleteAllRevokedChatInviteLinks
   parseDeleteAllRevokedChatInviteLinks = A.withObject "DeleteAllRevokedChatInviteLinks" $ \o -> do
    creator_user_id <- mconcat [ o A..:? "creator_user_id", readMaybe <$> (o A..: "creator_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteAllRevokedChatInviteLinks { creator_user_id = creator_user_id, chat_id = chat_id }
 parseJSON _ = mempty
