-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SponsoredMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SponsoredMessage as SponsoredMessage

-- |
-- 
-- Contains a list of sponsored messages 
-- 
-- __messages__ List of sponsored messages
data SponsoredMessages = 

 SponsoredMessages { messages :: Maybe [SponsoredMessage.SponsoredMessage] }  deriving (Show, Eq)

instance T.ToJSON SponsoredMessages where
 toJSON (SponsoredMessages { messages = messages }) =
  A.object [ "@type" A..= T.String "sponsoredMessages", "messages" A..= messages ]

instance T.FromJSON SponsoredMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sponsoredMessages" -> parseSponsoredMessages v
   _ -> mempty
  where
   parseSponsoredMessages :: A.Value -> T.Parser SponsoredMessages
   parseSponsoredMessages = A.withObject "SponsoredMessages" $ \o -> do
    messages <- o A..:? "messages"
    return $ SponsoredMessages { messages = messages }