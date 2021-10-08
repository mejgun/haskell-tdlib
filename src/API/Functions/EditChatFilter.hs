-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditChatFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatFilter as ChatFilter

-- |
-- 
-- Edits existing chat filter. Returns information about the edited chat filter 
-- 
-- __chat_filter_id__ Chat filter identifier
-- 
-- __filter__ The edited chat filter
data EditChatFilter = 

 EditChatFilter { _filter :: Maybe ChatFilter.ChatFilter, chat_filter_id :: Maybe Int }  deriving (Eq)

instance Show EditChatFilter where
 show EditChatFilter { _filter=_filter, chat_filter_id=chat_filter_id } =
  "EditChatFilter" ++ cc [p "_filter" _filter, p "chat_filter_id" chat_filter_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON EditChatFilter where
 toJSON EditChatFilter { _filter = _filter, chat_filter_id = chat_filter_id } =
  A.object [ "@type" A..= T.String "editChatFilter", "filter" A..= _filter, "chat_filter_id" A..= chat_filter_id ]

instance T.FromJSON EditChatFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editChatFilter" -> parseEditChatFilter v
   _ -> mempty
  where
   parseEditChatFilter :: A.Value -> T.Parser EditChatFilter
   parseEditChatFilter = A.withObject "EditChatFilter" $ \o -> do
    _filter <- o A..:? "filter"
    chat_filter_id <- mconcat [ o A..:? "chat_filter_id", readMaybe <$> (o A..: "chat_filter_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EditChatFilter { _filter = _filter, chat_filter_id = chat_filter_id }
 parseJSON _ = mempty
