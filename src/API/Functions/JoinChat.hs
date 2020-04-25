-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.JoinChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data JoinChat = 
 JoinChat { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON JoinChat where
 toJSON (JoinChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "joinChat", "chat_id" A..= chat_id ]

instance T.FromJSON JoinChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "joinChat" -> parseJoinChat v
   _ -> mempty
  where
   parseJoinChat :: A.Value -> T.Parser JoinChat
   parseJoinChat = A.withObject "JoinChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ JoinChat { chat_id = chat_id }