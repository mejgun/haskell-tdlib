-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineQueryResults where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InlineQueryResult as InlineQueryResult

data InlineQueryResults = 
 InlineQueryResults { switch_pm_parameter :: Maybe String, switch_pm_text :: Maybe String, results :: Maybe [InlineQueryResult.InlineQueryResult], next_offset :: Maybe String, inline_query_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON InlineQueryResults where
 toJSON (InlineQueryResults { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, results = results, next_offset = next_offset, inline_query_id = inline_query_id }) =
  A.object [ "@type" A..= T.String "inlineQueryResults", "switch_pm_parameter" A..= switch_pm_parameter, "switch_pm_text" A..= switch_pm_text, "results" A..= results, "next_offset" A..= next_offset, "inline_query_id" A..= inline_query_id ]

instance T.FromJSON InlineQueryResults where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inlineQueryResults" -> parseInlineQueryResults v
   _ -> mempty
  where
   parseInlineQueryResults :: A.Value -> T.Parser InlineQueryResults
   parseInlineQueryResults = A.withObject "InlineQueryResults" $ \o -> do
    switch_pm_parameter <- o A..:? "switch_pm_parameter"
    switch_pm_text <- o A..:? "switch_pm_text"
    results <- o A..:? "results"
    next_offset <- o A..:? "next_offset"
    inline_query_id <- mconcat [ o A..:? "inline_query_id", readMaybe <$> (o A..: "inline_query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ InlineQueryResults { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, results = results, next_offset = next_offset, inline_query_id = inline_query_id }