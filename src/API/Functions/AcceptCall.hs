-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AcceptCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol

-- |
-- 
-- Accepts an incoming call 
-- 
-- __call_id__ Call identifier
-- 
-- __protocol__ The call protocols supported by the application
data AcceptCall = 

 AcceptCall { protocol :: Maybe CallProtocol.CallProtocol, call_id :: Maybe Int }  deriving (Eq)

instance Show AcceptCall where
 show AcceptCall { protocol=protocol, call_id=call_id } =
  "AcceptCall" ++ cc [p "protocol" protocol, p "call_id" call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AcceptCall where
 toJSON AcceptCall { protocol = protocol, call_id = call_id } =
  A.object [ "@type" A..= T.String "acceptCall", "protocol" A..= protocol, "call_id" A..= call_id ]

instance T.FromJSON AcceptCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "acceptCall" -> parseAcceptCall v
   _ -> mempty
  where
   parseAcceptCall :: A.Value -> T.Parser AcceptCall
   parseAcceptCall = A.withObject "AcceptCall" $ \o -> do
    protocol <- o A..:? "protocol"
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AcceptCall { protocol = protocol, call_id = call_id }
 parseJSON _ = mempty
