-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageCaption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data EditInlineMessageCaption = 
 EditInlineMessageCaption { caption :: FormattedText.FormattedText, reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String }  deriving (Show)

instance T.ToJSON EditInlineMessageCaption where
 toJSON (EditInlineMessageCaption { caption = caption, reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageCaption", "caption" A..= caption, "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]



instance T.FromJSON EditInlineMessageCaption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editInlineMessageCaption" -> parseEditInlineMessageCaption v

   _ -> mempty ""
  where
   parseEditInlineMessageCaption :: A.Value -> T.Parser EditInlineMessageCaption
   parseEditInlineMessageCaption = A.withObject "EditInlineMessageCaption" $ \o -> do
    caption <- o A..: "caption"
    reply_markup <- o A..: "reply_markup"
    inline_message_id <- o A..: "inline_message_id"
    return $ EditInlineMessageCaption { caption = caption, reply_markup = reply_markup, inline_message_id = inline_message_id }