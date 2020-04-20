-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageMedia where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data EditInlineMessageMedia = 
 EditInlineMessageMedia { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String }  -- deriving (Show)

instance T.ToJSON EditInlineMessageMedia where
 toJSON (EditInlineMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageMedia", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]
-- editInlineMessageMedia EditInlineMessageMedia  { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String } 



instance T.FromJSON EditInlineMessageMedia where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageMedia" -> parseEditInlineMessageMedia v
  where
   parseEditInlineMessageMedia :: A.Value -> T.Parser EditInlineMessageMedia
   parseEditInlineMessageMedia = A.withObject "EditInlineMessageMedia" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    inline_message_id <- o A..: "inline_message_id"
    return $ EditInlineMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }