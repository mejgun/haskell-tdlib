-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Deletes existing chat filter 
-- 
-- __chat_filter_id__ Chat filter identifier
data DeleteChatFilter = 

 DeleteChatFilter { chat_filter_id :: Maybe Int }  deriving (Eq)

instance Show DeleteChatFilter where
 show DeleteChatFilter { chat_filter_id=chat_filter_id } =
  "DeleteChatFilter" ++ U.cc [U.p "chat_filter_id" chat_filter_id ]

instance T.ToJSON DeleteChatFilter where
 toJSON DeleteChatFilter { chat_filter_id = chat_filter_id } =
  A.object [ "@type" A..= T.String "deleteChatFilter", "chat_filter_id" A..= chat_filter_id ]

instance T.FromJSON DeleteChatFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatFilter" -> parseDeleteChatFilter v
   _ -> mempty
  where
   parseDeleteChatFilter :: A.Value -> T.Parser DeleteChatFilter
   parseDeleteChatFilter = A.withObject "DeleteChatFilter" $ \o -> do
    chat_filter_id <- mconcat [ o A..:? "chat_filter_id", readMaybe <$> (o A..: "chat_filter_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteChatFilter { chat_filter_id = chat_filter_id }
 parseJSON _ = mempty
