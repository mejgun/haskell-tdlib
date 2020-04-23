-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetInlineGameScore where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetInlineGameScore = 
 SetInlineGameScore { force :: Maybe Bool, score :: Maybe Int, user_id :: Maybe Int, edit_message :: Maybe Bool, inline_message_id :: Maybe String }  deriving (Show)

instance T.ToJSON SetInlineGameScore where
 toJSON (SetInlineGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "setInlineGameScore", "force" A..= force, "score" A..= score, "user_id" A..= user_id, "edit_message" A..= edit_message, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON SetInlineGameScore where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setInlineGameScore" -> parseSetInlineGameScore v
   _ -> mempty
  where
   parseSetInlineGameScore :: A.Value -> T.Parser SetInlineGameScore
   parseSetInlineGameScore = A.withObject "SetInlineGameScore" $ \o -> do
    force <- optional $ o A..: "force"
    score <- optional $ o A..: "score"
    user_id <- optional $ o A..: "user_id"
    edit_message <- optional $ o A..: "edit_message"
    inline_message_id <- optional $ o A..: "inline_message_id"
    return $ SetInlineGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, inline_message_id = inline_message_id }