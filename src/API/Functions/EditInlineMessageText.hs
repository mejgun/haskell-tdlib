-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditInlineMessageText = 
 EditInlineMessageText { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String }  deriving (Show)

instance T.ToJSON EditInlineMessageText where
 toJSON (EditInlineMessageText { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageText", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON EditInlineMessageText where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageText" -> parseEditInlineMessageText v
   _ -> mempty
  where
   parseEditInlineMessageText :: A.Value -> T.Parser EditInlineMessageText
   parseEditInlineMessageText = A.withObject "EditInlineMessageText" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    inline_message_id <- o A..: "inline_message_id"
    return $ EditInlineMessageText { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }