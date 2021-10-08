-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Returns information about a single member of a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __member_id__ Member identifier
data GetChatMember = 

 GetChatMember { member_id :: Maybe MessageSender.MessageSender, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatMember where
 show GetChatMember { member_id=member_id, chat_id=chat_id } =
  "GetChatMember" ++ cc [p "member_id" member_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatMember where
 toJSON GetChatMember { member_id = member_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatMember", "member_id" A..= member_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatMember" -> parseGetChatMember v
   _ -> mempty
  where
   parseGetChatMember :: A.Value -> T.Parser GetChatMember
   parseGetChatMember = A.withObject "GetChatMember" $ \o -> do
    member_id <- o A..:? "member_id"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatMember { member_id = member_id, chat_id = chat_id }
 parseJSON _ = mempty
