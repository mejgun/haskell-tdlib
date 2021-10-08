-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RecommendedChatFilters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.RecommendedChatFilter as RecommendedChatFilter

-- |
-- 
-- Contains a list of recommended chat filters 
-- 
-- __chat_filters__ List of recommended chat filters
data RecommendedChatFilters = 

 RecommendedChatFilters { chat_filters :: Maybe [RecommendedChatFilter.RecommendedChatFilter] }  deriving (Eq)

instance Show RecommendedChatFilters where
 show RecommendedChatFilters { chat_filters=chat_filters } =
  "RecommendedChatFilters" ++ cc [p "chat_filters" chat_filters ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RecommendedChatFilters where
 toJSON RecommendedChatFilters { chat_filters = chat_filters } =
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
 parseJSON _ = mempty
