-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageCopyOptions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Options to be used when a message content is copied without reference to the original sender. Service messages and messageInvoice can't be copied
-- 
-- __send_copy__ True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local
-- 
-- __replace_caption__ True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false
-- 
-- __new_caption__ New message caption; pass null to copy message without caption. Ignored if replace_caption is false
data MessageCopyOptions = 

 MessageCopyOptions { new_caption :: Maybe FormattedText.FormattedText, replace_caption :: Maybe Bool, send_copy :: Maybe Bool }  deriving (Eq)

instance Show MessageCopyOptions where
 show MessageCopyOptions { new_caption=new_caption, replace_caption=replace_caption, send_copy=send_copy } =
  "MessageCopyOptions" ++ U.cc [U.p "new_caption" new_caption, U.p "replace_caption" replace_caption, U.p "send_copy" send_copy ]

instance T.ToJSON MessageCopyOptions where
 toJSON MessageCopyOptions { new_caption = new_caption, replace_caption = replace_caption, send_copy = send_copy } =
  A.object [ "@type" A..= T.String "messageCopyOptions", "new_caption" A..= new_caption, "replace_caption" A..= replace_caption, "send_copy" A..= send_copy ]

instance T.FromJSON MessageCopyOptions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageCopyOptions" -> parseMessageCopyOptions v
   _ -> mempty
  where
   parseMessageCopyOptions :: A.Value -> T.Parser MessageCopyOptions
   parseMessageCopyOptions = A.withObject "MessageCopyOptions" $ \o -> do
    new_caption <- o A..:? "new_caption"
    replace_caption <- o A..:? "replace_caption"
    send_copy <- o A..:? "send_copy"
    return $ MessageCopyOptions { new_caption = new_caption, replace_caption = replace_caption, send_copy = send_copy }
 parseJSON _ = mempty
