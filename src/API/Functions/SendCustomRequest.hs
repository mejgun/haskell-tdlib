-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCustomRequest where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Sends a custom request; for bots only 
-- 
-- __method__ The method name
-- 
-- __parameters__ JSON-serialized method parameters
data SendCustomRequest = 

 SendCustomRequest { parameters :: Maybe String, method :: Maybe String }  deriving (Eq)

instance Show SendCustomRequest where
 show SendCustomRequest { parameters=parameters, method=method } =
  "SendCustomRequest" ++ cc [p "parameters" parameters, p "method" method ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendCustomRequest where
 toJSON SendCustomRequest { parameters = parameters, method = method } =
  A.object [ "@type" A..= T.String "sendCustomRequest", "parameters" A..= parameters, "method" A..= method ]

instance T.FromJSON SendCustomRequest where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendCustomRequest" -> parseSendCustomRequest v
   _ -> mempty
  where
   parseSendCustomRequest :: A.Value -> T.Parser SendCustomRequest
   parseSendCustomRequest = A.withObject "SendCustomRequest" $ \o -> do
    parameters <- o A..:? "parameters"
    method <- o A..:? "method"
    return $ SendCustomRequest { parameters = parameters, method = method }
 parseJSON _ = mempty
