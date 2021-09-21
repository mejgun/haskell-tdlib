-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FoundMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message

-- |
-- 
-- Contains a list of messages found by a search 
-- 
-- __total_count__ Approximate total count of messages found; -1 if unknown
-- 
-- __messages__ List of messages
-- 
-- __next_offset__ The offset for the next request. If empty, there are no more results
data FoundMessages = 

 FoundMessages { next_offset :: Maybe String, messages :: Maybe [Message.Message], total_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON FoundMessages where
 toJSON (FoundMessages { next_offset = next_offset, messages = messages, total_count = total_count }) =
  A.object [ "@type" A..= T.String "foundMessages", "next_offset" A..= next_offset, "messages" A..= messages, "total_count" A..= total_count ]

instance T.FromJSON FoundMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "foundMessages" -> parseFoundMessages v
   _ -> mempty
  where
   parseFoundMessages :: A.Value -> T.Parser FoundMessages
   parseFoundMessages = A.withObject "FoundMessages" $ \o -> do
    next_offset <- o A..:? "next_offset"
    messages <- o A..:? "messages"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ FoundMessages { next_offset = next_offset, messages = messages, total_count = total_count }