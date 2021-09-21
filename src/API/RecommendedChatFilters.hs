-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RecommendedChatFilters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.RecommendedChatFilter as RecommendedChatFilter

-- |
-- 
-- Contains a list of recommended chat filters 
-- 
-- __chat_filters__ List of recommended chat filters
data RecommendedChatFilters = 

 RecommendedChatFilters { chat_filters :: Maybe [RecommendedChatFilter.RecommendedChatFilter] }  deriving (Show, Eq)

instance T.ToJSON RecommendedChatFilters where
 toJSON (RecommendedChatFilters { chat_filters = chat_filters }) =
  A.object [ "@type" A..= T.String "recommendedChatFilters", "chat_filters" A..= chat_filters ]

instance T.FromJSON RecommendedChatFilters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "recommendedChatFilters" -> parseRecommendedChatFilters v
   _ -> mempty
  where
   parseRecommendedChatFilters :: A.Value -> T.Parser RecommendedChatFilters
   parseRecommendedChatFilters = A.withObject "RecommendedChatFilters" $ \o -> do
    chat_filters <- o A..:? "chat_filters"
    return $ RecommendedChatFilters { chat_filters = chat_filters }