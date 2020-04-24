-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatActionBar where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatActionBar = 
 ChatActionBarReportSpam 
 | ChatActionBarReportUnrelatedLocation 
 | ChatActionBarReportAddBlock 
 | ChatActionBarAddContact 
 | ChatActionBarSharePhoneNumber deriving (Show, Eq)

instance T.ToJSON ChatActionBar where
 toJSON (ChatActionBarReportSpam {  }) =
  A.object [ "@type" A..= T.String "chatActionBarReportSpam" ]

 toJSON (ChatActionBarReportUnrelatedLocation {  }) =
  A.object [ "@type" A..= T.String "chatActionBarReportUnrelatedLocation" ]

 toJSON (ChatActionBarReportAddBlock {  }) =
  A.object [ "@type" A..= T.String "chatActionBarReportAddBlock" ]

 toJSON (ChatActionBarAddContact {  }) =
  A.object [ "@type" A..= T.String "chatActionBarAddContact" ]

 toJSON (ChatActionBarSharePhoneNumber {  }) =
  A.object [ "@type" A..= T.String "chatActionBarSharePhoneNumber" ]

instance T.FromJSON ChatActionBar where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatActionBarReportSpam" -> parseChatActionBarReportSpam v
   "chatActionBarReportUnrelatedLocation" -> parseChatActionBarReportUnrelatedLocation v
   "chatActionBarReportAddBlock" -> parseChatActionBarReportAddBlock v
   "chatActionBarAddContact" -> parseChatActionBarAddContact v
   "chatActionBarSharePhoneNumber" -> parseChatActionBarSharePhoneNumber v
   _ -> mempty
  where
   parseChatActionBarReportSpam :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarReportSpam = A.withObject "ChatActionBarReportSpam" $ \o -> do
    return $ ChatActionBarReportSpam {  }

   parseChatActionBarReportUnrelatedLocation :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarReportUnrelatedLocation = A.withObject "ChatActionBarReportUnrelatedLocation" $ \o -> do
    return $ ChatActionBarReportUnrelatedLocation {  }

   parseChatActionBarReportAddBlock :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarReportAddBlock = A.withObject "ChatActionBarReportAddBlock" $ \o -> do
    return $ ChatActionBarReportAddBlock {  }

   parseChatActionBarAddContact :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarAddContact = A.withObject "ChatActionBarAddContact" $ \o -> do
    return $ ChatActionBarAddContact {  }

   parseChatActionBarSharePhoneNumber :: A.Value -> T.Parser ChatActionBar
   parseChatActionBarSharePhoneNumber = A.withObject "ChatActionBarSharePhoneNumber" $ \o -> do
    return $ ChatActionBarSharePhoneNumber {  }