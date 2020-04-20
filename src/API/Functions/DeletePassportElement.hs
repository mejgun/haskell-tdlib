-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeletePassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

--main = putStrLn "ok"

data DeletePassportElement = 
 DeletePassportElement { _type :: PassportElementType.PassportElementType }  -- deriving (Show)

instance T.ToJSON DeletePassportElement where
 toJSON (DeletePassportElement { _type = _type }) =
  A.object [ "@type" A..= T.String "deletePassportElement", "type" A..= _type ]
-- deletePassportElement DeletePassportElement  { _type :: PassportElementType.PassportElementType } 



instance T.FromJSON DeletePassportElement where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deletePassportElement" -> parseDeletePassportElement v
  where
   parseDeletePassportElement :: A.Value -> T.Parser DeletePassportElement
   parseDeletePassportElement = A.withObject "DeletePassportElement" $ \o -> do
    _type <- o A..: "type"
    return $ DeletePassportElement { _type = _type }