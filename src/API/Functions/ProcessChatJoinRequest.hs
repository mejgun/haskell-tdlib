-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ProcessChatJoinRequest where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Handles a pending join request in a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __user_id__ Identifier of the user that sent the request
-- 
-- __approve__ Pass true to approve the request; pass false to decline it
data ProcessChatJoinRequest = 

 ProcessChatJoinRequest { approve :: Maybe Bool, user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show ProcessChatJoinRequest where
 show ProcessChatJoinRequest { approve=approve, user_id=user_id, chat_id=chat_id } =
  "ProcessChatJoinRequest" ++ cc [p "approve" approve, p "user_id" user_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ProcessChatJoinRequest where
 toJSON ProcessChatJoinRequest { approve = approve, user_id = user_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "processChatJoinRequest", "approve" A..= approve, "user_id" A..= user_id, "chat_id" A..= chat_id ]

instance T.FromJSON ProcessChatJoinRequest where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "processChatJoinRequest" -> parseProcessChatJoinRequest v
   _ -> mempty
  where
   parseProcessChatJoinRequest :: A.Value -> T.Parser ProcessChatJoinRequest
   parseProcessChatJoinRequest = A.withObject "ProcessChatJoinRequest" $ \o -> do
    approve <- o A..:? "approve"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ProcessChatJoinRequest { approve = approve, user_id = user_id, chat_id = chat_id }
 parseJSON _ = mempty
