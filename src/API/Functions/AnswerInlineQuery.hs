-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerInlineQuery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputInlineQueryResult as InputInlineQueryResult

-- |
-- 
-- Sets the result of an inline query; for bots only 
-- 
-- __inline_query_id__ Identifier of the inline query
-- 
-- __is_personal__ True, if the result of the query can be cached for the specified user
-- 
-- __results__ The results of the query
-- 
-- __cache_time__ Allowed time to cache the results of the query, in seconds
-- 
-- __next_offset__ Offset for the next inline query; pass an empty string if there are no more results
-- 
-- __switch_pm_text__ If non-empty, this text should be shown on the button that opens a private chat with the bot and sends a start message to the bot with the parameter switch_pm_parameter
-- 
-- __switch_pm_parameter__ The parameter for the bot start message
data AnswerInlineQuery = 
 AnswerInlineQuery { switch_pm_parameter :: Maybe String, switch_pm_text :: Maybe String, next_offset :: Maybe String, cache_time :: Maybe Int, results :: Maybe [InputInlineQueryResult.InputInlineQueryResult], is_personal :: Maybe Bool, inline_query_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AnswerInlineQuery where
 toJSON (AnswerInlineQuery { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, next_offset = next_offset, cache_time = cache_time, results = results, is_personal = is_personal, inline_query_id = inline_query_id }) =
  A.object [ "@type" A..= T.String "answerInlineQuery", "switch_pm_parameter" A..= switch_pm_parameter, "switch_pm_text" A..= switch_pm_text, "next_offset" A..= next_offset, "cache_time" A..= cache_time, "results" A..= results, "is_personal" A..= is_personal, "inline_query_id" A..= inline_query_id ]

instance T.FromJSON AnswerInlineQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerInlineQuery" -> parseAnswerInlineQuery v
   _ -> mempty
  where
   parseAnswerInlineQuery :: A.Value -> T.Parser AnswerInlineQuery
   parseAnswerInlineQuery = A.withObject "AnswerInlineQuery" $ \o -> do
    switch_pm_parameter <- o A..:? "switch_pm_parameter"
    switch_pm_text <- o A..:? "switch_pm_text"
    next_offset <- o A..:? "next_offset"
    cache_time <- mconcat [ o A..:? "cache_time", readMaybe <$> (o A..: "cache_time" :: T.Parser String)] :: T.Parser (Maybe Int)
    results <- o A..:? "results"
    is_personal <- o A..:? "is_personal"
    inline_query_id <- mconcat [ o A..:? "inline_query_id", readMaybe <$> (o A..: "inline_query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AnswerInlineQuery { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, next_offset = next_offset, cache_time = cache_time, results = results, is_personal = is_personal, inline_query_id = inline_query_id }