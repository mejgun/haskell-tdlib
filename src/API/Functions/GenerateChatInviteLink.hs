-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GenerateChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GenerateChatInviteLink = 
 GenerateChatInviteLink { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GenerateChatInviteLink where
 toJSON (GenerateChatInviteLink { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "generateChatInviteLink", "chat_id" A..= chat_id ]

instance T.FromJSON GenerateChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "generateChatInviteLink" -> parseGenerateChatInviteLink v
   _ -> mempty
  where
   parseGenerateChatInviteLink :: A.Value -> T.Parser GenerateChatInviteLink
   parseGenerateChatInviteLink = A.withObject "GenerateChatInviteLink" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GenerateChatInviteLink { chat_id = chat_id }