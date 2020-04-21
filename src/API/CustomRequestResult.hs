-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CustomRequestResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CustomRequestResult = 
 CustomRequestResult { result :: String }  deriving (Show)

instance T.ToJSON CustomRequestResult where
 toJSON (CustomRequestResult { result = result }) =
  A.object [ "@type" A..= T.String "customRequestResult", "result" A..= result ]



instance T.FromJSON CustomRequestResult where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "customRequestResult" -> parseCustomRequestResult v

   _ -> mempty ""
  where
   parseCustomRequestResult :: A.Value -> T.Parser CustomRequestResult
   parseCustomRequestResult = A.withObject "CustomRequestResult" $ \o -> do
    result <- o A..: "result"
    return $ CustomRequestResult { result = result }