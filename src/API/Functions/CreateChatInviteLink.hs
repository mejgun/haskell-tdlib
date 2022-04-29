-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Creates a new invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat
-- 
-- __chat_id__ Chat identifier
-- 
-- __name__ Invite link name; 0-32 characters
-- 
-- __expiration_date__ Point in time (Unix timestamp) when the link will expire; pass 0 if never
-- 
-- __member_limit__ The maximum number of chat members that can join the chat via the link simultaneously; 0-99999; pass 0 if not limited
-- 
-- __creates_join_request__ Pass true if users joining the chat via the link need to be approved by chat administrators. In this case, member_limit must be 0
data CreateChatInviteLink = 

 CreateChatInviteLink { creates_join_request :: Maybe Bool, member_limit :: Maybe Int, expiration_date :: Maybe Int, name :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show CreateChatInviteLink where
 show CreateChatInviteLink { creates_join_request=creates_join_request, member_limit=member_limit, expiration_date=expiration_date, name=name, chat_id=chat_id } =
  "CreateChatInviteLink" ++ cc [p "creates_join_request" creates_join_request, p "member_limit" member_limit, p "expiration_date" expiration_date, p "name" name, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CreateChatInviteLink where
 toJSON CreateChatInviteLink { creates_join_request = creates_join_request, member_limit = member_limit, expiration_date = expiration_date, name = name, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "createChatInviteLink", "creates_join_request" A..= creates_join_request, "member_limit" A..= member_limit, "expiration_date" A..= expiration_date, "name" A..= name, "chat_id" A..= chat_id ]

instance T.FromJSON CreateChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createChatInviteLink" -> parseCreateChatInviteLink v
   _ -> mempty
  where
   parseCreateChatInviteLink :: A.Value -> T.Parser CreateChatInviteLink
   parseCreateChatInviteLink = A.withObject "CreateChatInviteLink" $ \o -> do
    creates_join_request <- o A..:? "creates_join_request"
    member_limit <- mconcat [ o A..:? "member_limit", readMaybe <$> (o A..: "member_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    expiration_date <- mconcat [ o A..:? "expiration_date", readMaybe <$> (o A..: "expiration_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    name <- o A..:? "name"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateChatInviteLink { creates_join_request = creates_join_request, member_limit = member_limit, expiration_date = expiration_date, name = name, chat_id = chat_id }
 parseJSON _ = mempty
