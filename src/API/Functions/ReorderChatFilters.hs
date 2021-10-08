-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReorderChatFilters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Changes the order of chat filters 
-- 
-- __chat_filter_ids__ Identifiers of chat filters in the new correct order
data ReorderChatFilters = 

 ReorderChatFilters { chat_filter_ids :: Maybe [Int] }  deriving (Eq)

instance Show ReorderChatFilters where
 show ReorderChatFilters { chat_filter_ids=chat_filter_ids } =
  "ReorderChatFilters" ++ cc [p "chat_filter_ids" chat_filter_ids ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ReorderChatFilters where
 toJSON ReorderChatFilters { chat_filter_ids = chat_filter_ids } =
  A.object [ "@type" A..= T.String "reorderChatFilters", "chat_filter_ids" A..= chat_filter_ids ]

instance T.FromJSON ReorderChatFilters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "reorderChatFilters" -> parseReorderChatFilters v
   _ -> mempty
  where
   parseReorderChatFilters :: A.Value -> T.Parser ReorderChatFilters
   parseReorderChatFilters = A.withObject "ReorderChatFilters" $ \o -> do
    chat_filter_ids <- o A..:? "chat_filter_ids"
    return $ ReorderChatFilters { chat_filter_ids = chat_filter_ids }
 parseJSON _ = mempty
