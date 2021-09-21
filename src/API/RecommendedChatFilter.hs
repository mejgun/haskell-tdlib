-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RecommendedChatFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatFilter as ChatFilter

-- |
-- 
-- Describes a recommended chat filter 
-- 
-- __filter__ The chat filter
-- 
-- __param_description__ Chat filter description
data RecommendedChatFilter = 

 RecommendedChatFilter { description :: Maybe String, _filter :: Maybe ChatFilter.ChatFilter }  deriving (Show, Eq)

instance T.ToJSON RecommendedChatFilter where
 toJSON (RecommendedChatFilter { description = description, _filter = _filter }) =
  A.object [ "@type" A..= T.String "recommendedChatFilter", "description" A..= description, "filter" A..= _filter ]

instance T.FromJSON RecommendedChatFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "recommendedChatFilter" -> parseRecommendedChatFilter v
   _ -> mempty
  where
   parseRecommendedChatFilter :: A.Value -> T.Parser RecommendedChatFilter
   parseRecommendedChatFilter = A.withObject "RecommendedChatFilter" $ \o -> do
    description <- o A..:? "description"
    _filter <- o A..:? "filter"
    return $ RecommendedChatFilter { description = description, _filter = _filter }