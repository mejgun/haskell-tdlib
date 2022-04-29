-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchOutgoingDocumentMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for outgoing messages with content of the type messageDocument in all chats except secret chats. Returns the results in reverse chronological order
-- 
-- __query__ Query to search for in document file name and message caption
-- 
-- __limit__ The maximum number of messages to be returned; up to 100
data SearchOutgoingDocumentMessages = 

 SearchOutgoingDocumentMessages { limit :: Maybe Int, query :: Maybe String }  deriving (Eq)

instance Show SearchOutgoingDocumentMessages where
 show SearchOutgoingDocumentMessages { limit=limit, query=query } =
  "SearchOutgoingDocumentMessages" ++ cc [p "limit" limit, p "query" query ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchOutgoingDocumentMessages where
 toJSON SearchOutgoingDocumentMessages { limit = limit, query = query } =
  A.object [ "@type" A..= T.String "searchOutgoingDocumentMessages", "limit" A..= limit, "query" A..= query ]

instance T.FromJSON SearchOutgoingDocumentMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchOutgoingDocumentMessages" -> parseSearchOutgoingDocumentMessages v
   _ -> mempty
  where
   parseSearchOutgoingDocumentMessages :: A.Value -> T.Parser SearchOutgoingDocumentMessages
   parseSearchOutgoingDocumentMessages = A.withObject "SearchOutgoingDocumentMessages" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    return $ SearchOutgoingDocumentMessages { limit = limit, query = query }
 parseJSON _ = mempty
