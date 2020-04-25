-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FoundMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message

data FoundMessages = 
 FoundMessages { next_from_search_id :: Maybe Int, messages :: Maybe [Message.Message] }  deriving (Show, Eq)

instance T.ToJSON FoundMessages where
 toJSON (FoundMessages { next_from_search_id = next_from_search_id, messages = messages }) =
  A.object [ "@type" A..= T.String "foundMessages", "next_from_search_id" A..= next_from_search_id, "messages" A..= messages ]

instance T.FromJSON FoundMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "foundMessages" -> parseFoundMessages v
   _ -> mempty
  where
   parseFoundMessages :: A.Value -> T.Parser FoundMessages
   parseFoundMessages = A.withObject "FoundMessages" $ \o -> do
    next_from_search_id <- mconcat [ o A..:? "next_from_search_id", readMaybe <$> (o A..: "next_from_search_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    messages <- o A..:? "messages"
    return $ FoundMessages { next_from_search_id = next_from_search_id, messages = messages }