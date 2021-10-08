-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReplacePrimaryChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right 
-- 
-- __chat_id__ Chat identifier
data ReplacePrimaryChatInviteLink = 

 ReplacePrimaryChatInviteLink { chat_id :: Maybe Int }  deriving (Eq)

instance Show ReplacePrimaryChatInviteLink where
 show ReplacePrimaryChatInviteLink { chat_id=chat_id } =
  "ReplacePrimaryChatInviteLink" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ReplacePrimaryChatInviteLink where
 toJSON ReplacePrimaryChatInviteLink { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "replacePrimaryChatInviteLink", "chat_id" A..= chat_id ]

instance T.FromJSON ReplacePrimaryChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "replacePrimaryChatInviteLink" -> parseReplacePrimaryChatInviteLink v
   _ -> mempty
  where
   parseReplacePrimaryChatInviteLink :: A.Value -> T.Parser ReplacePrimaryChatInviteLink
   parseReplacePrimaryChatInviteLink = A.withObject "ReplacePrimaryChatInviteLink" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReplacePrimaryChatInviteLink { chat_id = chat_id }
 parseJSON _ = mempty
