-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetTdlibParameters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.TdlibParameters as TdlibParameters

-- |
-- 
-- Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters 
-- 
-- __parameters__ Parameters for TDLib initialization
data SetTdlibParameters = 

 SetTdlibParameters { parameters :: Maybe TdlibParameters.TdlibParameters }  deriving (Eq)

instance Show SetTdlibParameters where
 show SetTdlibParameters { parameters=parameters } =
  "SetTdlibParameters" ++ cc [p "parameters" parameters ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetTdlibParameters where
 toJSON SetTdlibParameters { parameters = parameters } =
  A.object [ "@type" A..= T.String "setTdlibParameters", "parameters" A..= parameters ]

instance T.FromJSON SetTdlibParameters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setTdlibParameters" -> parseSetTdlibParameters v
   _ -> mempty
  where
   parseSetTdlibParameters :: A.Value -> T.Parser SetTdlibParameters
   parseSetTdlibParameters = A.withObject "SetTdlibParameters" $ \o -> do
    parameters <- o A..:? "parameters"
    return $ SetTdlibParameters { parameters = parameters }
 parseJSON _ = mempty
