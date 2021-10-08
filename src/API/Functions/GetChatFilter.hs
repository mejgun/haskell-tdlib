-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a chat filter by its identifier 
-- 
-- __chat_filter_id__ Chat filter identifier
data GetChatFilter = 

 GetChatFilter { chat_filter_id :: Maybe Int }  deriving (Eq)

instance Show GetChatFilter where
 show GetChatFilter { chat_filter_id=chat_filter_id } =
  "GetChatFilter" ++ cc [p "chat_filter_id" chat_filter_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatFilter where
 toJSON GetChatFilter { chat_filter_id = chat_filter_id } =
  A.object [ "@type" A..= T.String "getChatFilter", "chat_filter_id" A..= chat_filter_id ]

instance T.FromJSON GetChatFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatFilter" -> parseGetChatFilter v
   _ -> mempty
  where
   parseGetChatFilter :: A.Value -> T.Parser GetChatFilter
   parseGetChatFilter = A.withObject "GetChatFilter" $ \o -> do
    chat_filter_id <- mconcat [ o A..:? "chat_filter_id", readMaybe <$> (o A..: "chat_filter_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatFilter { chat_filter_id = chat_filter_id }
 parseJSON _ = mempty
