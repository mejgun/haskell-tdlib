-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageMedia where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditInlineMessageMedia = 
 EditInlineMessageMedia { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, inline_message_id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON EditInlineMessageMedia where
 toJSON (EditInlineMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageMedia", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON EditInlineMessageMedia where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageMedia" -> parseEditInlineMessageMedia v
   _ -> mempty
  where
   parseEditInlineMessageMedia :: A.Value -> T.Parser EditInlineMessageMedia
   parseEditInlineMessageMedia = A.withObject "EditInlineMessageMedia" $ \o -> do
    input_message_content <- optional $ o A..: "input_message_content"
    reply_markup <- optional $ o A..: "reply_markup"
    inline_message_id <- optional $ o A..: "inline_message_id"
    return $ EditInlineMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }