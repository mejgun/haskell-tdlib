-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetTdlibParameters where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TdlibParameters as TdlibParameters

data SetTdlibParameters = 
 SetTdlibParameters { parameters :: Maybe TdlibParameters.TdlibParameters }  deriving (Show)

instance T.ToJSON SetTdlibParameters where
 toJSON (SetTdlibParameters { parameters = parameters }) =
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
    parameters <- optional $ o A..: "parameters"
    return $ SetTdlibParameters { parameters = parameters }