-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageText where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Edits the text of an inline text or game message sent via a bot; for bots only
-- 
-- __inline_message_id__ Inline message identifier
-- 
-- __reply_markup__ The new message reply markup; pass null if none
-- 
-- __input_message_content__ New text content of the message. Must be of type inputMessageText
data EditInlineMessageText = 

 EditInlineMessageText { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, inline_message_id :: Maybe String }  deriving (Eq)

instance Show EditInlineMessageText where
 show EditInlineMessageText { input_message_content=input_message_content, reply_markup=reply_markup, inline_message_id=inline_message_id } =
  "EditInlineMessageText" ++ U.cc [U.p "input_message_content" input_message_content, U.p "reply_markup" reply_markup, U.p "inline_message_id" inline_message_id ]

instance T.ToJSON EditInlineMessageText where
 toJSON EditInlineMessageText { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id } =
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
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    inline_message_id <- o A..:? "inline_message_id"
    return $ EditInlineMessageText { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }
 parseJSON _ = mempty
