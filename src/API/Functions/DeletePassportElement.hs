-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeletePassportElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

-- |
-- 
-- Deletes a Telegram Passport element 
-- 
-- __type__ Element type
data DeletePassportElement = 

 DeletePassportElement { _type :: Maybe PassportElementType.PassportElementType }  deriving (Eq)

instance Show DeletePassportElement where
 show DeletePassportElement { _type=_type } =
  "DeletePassportElement" ++ U.cc [U.p "_type" _type ]

instance T.ToJSON DeletePassportElement where
 toJSON DeletePassportElement { _type = _type } =
  A.object [ "@type" A..= T.String "deletePassportElement", "type" A..= _type ]

instance T.FromJSON DeletePassportElement where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deletePassportElement" -> parseDeletePassportElement v
   _ -> mempty
  where
   parseDeletePassportElement :: A.Value -> T.Parser DeletePassportElement
   parseDeletePassportElement = A.withObject "DeletePassportElement" $ \o -> do
    _type <- o A..:? "type"
    return $ DeletePassportElement { _type = _type }
 parseJSON _ = mempty
