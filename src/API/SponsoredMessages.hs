-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SponsoredMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.SponsoredMessage as SponsoredMessage

-- |
-- 
-- Contains a list of sponsored messages 
-- 
-- __messages__ List of sponsored messages
data SponsoredMessages = 

 SponsoredMessages { messages :: Maybe [SponsoredMessage.SponsoredMessage] }  deriving (Eq)

instance Show SponsoredMessages where
 show SponsoredMessages { messages=messages } =
  "SponsoredMessages" ++ cc [p "messages" messages ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SponsoredMessages where
 toJSON SponsoredMessages { messages = messages } =
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
 parseJSON _ = mempty
