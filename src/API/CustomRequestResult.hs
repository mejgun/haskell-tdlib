-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CustomRequestResult where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains the result of a custom request 
-- 
-- __result__ A JSON-serialized result
data CustomRequestResult = 
 CustomRequestResult { result :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CustomRequestResult where
 toJSON (CustomRequestResult { result = result }) =
  A.object [ "@type" A..= T.String "customRequestResult", "result" A..= result ]

instance T.FromJSON CustomRequestResult where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "customRequestResult" -> parseCustomRequestResult v
   _ -> mempty
  where
   parseCustomRequestResult :: A.Value -> T.Parser CustomRequestResult
   parseCustomRequestResult = A.withObject "CustomRequestResult" $ \o -> do
    result <- o A..:? "result"
    return $ CustomRequestResult { result = result }