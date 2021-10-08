-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchCallMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
-- 
-- __from_message_id__ Identifier of the message from which to search; use 0 to get results from the last message
-- 
-- __limit__ The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
-- 
-- __only_missed__ If true, returns only messages with missed calls
data SearchCallMessages = 

 SearchCallMessages { only_missed :: Maybe Bool, limit :: Maybe Int, from_message_id :: Maybe Int }  deriving (Eq)

instance Show SearchCallMessages where
 show SearchCallMessages { only_missed=only_missed, limit=limit, from_message_id=from_message_id } =
  "SearchCallMessages" ++ cc [p "only_missed" only_missed, p "limit" limit, p "from_message_id" from_message_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchCallMessages where
 toJSON SearchCallMessages { only_missed = only_missed, limit = limit, from_message_id = from_message_id } =
  A.object [ "@type" A..= T.String "searchCallMessages", "only_missed" A..= only_missed, "limit" A..= limit, "from_message_id" A..= from_message_id ]

instance T.FromJSON SearchCallMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchCallMessages" -> parseSearchCallMessages v
   _ -> mempty
  where
   parseSearchCallMessages :: A.Value -> T.Parser SearchCallMessages
   parseSearchCallMessages = A.withObject "SearchCallMessages" $ \o -> do
    only_missed <- o A..:? "only_missed"
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_message_id <- mconcat [ o A..:? "from_message_id", readMaybe <$> (o A..: "from_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchCallMessages { only_missed = only_missed, limit = limit, from_message_id = from_message_id }
 parseJSON _ = mempty
