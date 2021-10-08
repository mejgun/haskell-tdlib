-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatInviteLinkCounts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns list of chat administrators with number of their invite links. Requires owner privileges in the chat 
-- 
-- __chat_id__ Chat identifier
data GetChatInviteLinkCounts = 

 GetChatInviteLinkCounts { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatInviteLinkCounts where
 show GetChatInviteLinkCounts { chat_id=chat_id } =
  "GetChatInviteLinkCounts" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatInviteLinkCounts where
 toJSON GetChatInviteLinkCounts { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatInviteLinkCounts", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatInviteLinkCounts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatInviteLinkCounts" -> parseGetChatInviteLinkCounts v
   _ -> mempty
  where
   parseGetChatInviteLinkCounts :: A.Value -> T.Parser GetChatInviteLinkCounts
   parseGetChatInviteLinkCounts = A.withObject "GetChatInviteLinkCounts" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatInviteLinkCounts { chat_id = chat_id }
 parseJSON _ = mempty
