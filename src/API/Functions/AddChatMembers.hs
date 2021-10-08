-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddChatMembers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Adds multiple new members to a chat. Currently this method is only available for supergroups and channels. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members
-- 
-- __chat_id__ Chat identifier
-- 
-- __user_ids__ Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
data AddChatMembers = 

 AddChatMembers { user_ids :: Maybe [Int], chat_id :: Maybe Int }  deriving (Eq)

instance Show AddChatMembers where
 show AddChatMembers { user_ids=user_ids, chat_id=chat_id } =
  "AddChatMembers" ++ cc [p "user_ids" user_ids, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AddChatMembers where
 toJSON AddChatMembers { user_ids = user_ids, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "addChatMembers", "user_ids" A..= user_ids, "chat_id" A..= chat_id ]

instance T.FromJSON AddChatMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addChatMembers" -> parseAddChatMembers v
   _ -> mempty
  where
   parseAddChatMembers :: A.Value -> T.Parser AddChatMembers
   parseAddChatMembers = A.withObject "AddChatMembers" $ \o -> do
    user_ids <- o A..:? "user_ids"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AddChatMembers { user_ids = user_ids, chat_id = chat_id }
 parseJSON _ = mempty
