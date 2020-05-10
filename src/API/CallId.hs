-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallId where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains the call identifier 
-- 
-- __id__ Call identifier
data CallId = 

 CallId { _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CallId where
 toJSON (CallId { _id = _id }) =
  A.object [ "@type" A..= T.String "callId", "id" A..= _id ]

instance T.FromJSON CallId where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callId" -> parseCallId v
   _ -> mempty
  where
   parseCallId :: A.Value -> T.Parser CallId
   parseCallId = A.withObject "CallId" $ \o -> do
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CallId { _id = _id }