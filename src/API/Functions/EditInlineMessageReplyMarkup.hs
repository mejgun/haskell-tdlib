-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageReplyMarkup where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditInlineMessageReplyMarkup = 
 EditInlineMessageReplyMarkup { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, inline_message_id :: Maybe String }  deriving (Show)

instance T.ToJSON EditInlineMessageReplyMarkup where
 toJSON (EditInlineMessageReplyMarkup { reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageReplyMarkup", "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON EditInlineMessageReplyMarkup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageReplyMarkup" -> parseEditInlineMessageReplyMarkup v
   _ -> mempty
  where
   parseEditInlineMessageReplyMarkup :: A.Value -> T.Parser EditInlineMessageReplyMarkup
   parseEditInlineMessageReplyMarkup = A.withObject "EditInlineMessageReplyMarkup" $ \o -> do
    reply_markup <- optional $ o A..: "reply_markup"
    inline_message_id <- optional $ o A..: "inline_message_id"
    return $ EditInlineMessageReplyMarkup { reply_markup = reply_markup, inline_message_id = inline_message_id }